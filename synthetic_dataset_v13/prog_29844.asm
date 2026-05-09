; DESCRIPTION: Composite: Places a red 32x22 rectangle at position (470, 10) then Sets a single white pixel at (149, 247) then Renders a cyan line between points (275, 57) and (67, 190).
; PLAN: r0=470(x), r1=10(y), r2=32(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=149(x), r6=247(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=275(x1), r11=57(y1), r12=67(x2), r13=190(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 470
LDI r1, 10
LDI r2, 32
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 149
LDI r6, 247
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 275
LDI r11, 57
LDI r12, 67
LDI r13, 190
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
