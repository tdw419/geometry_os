; DESCRIPTION: Composite: Renders a green box of size 28x12 starting at (24, 47) then Sets a single purple pixel at (337, 126) then Places a white line segment connecting (25, 114) to (439, 228).
; PLAN: r0=24(x), r1=47(y), r2=28(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=337(x), r6=126(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=25(x1), r11=114(y1), r12=439(x2), r13=228(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 24
LDI r1, 47
LDI r2, 28
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 126
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 25
LDI r11, 114
LDI r12, 439
LDI r13, 228
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
