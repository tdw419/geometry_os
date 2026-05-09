; DESCRIPTION: Composite: Renders a orange line between points (176, 124) and (480, 122) then Renders a cyan box of size 39x38 starting at (337, 194).
; PLAN: r0=176(x1), r1=124(y1), r2=480(x2), r3=122(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=337(x), r6=194(y), r7=39(width), r8=38(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 176
LDI r1, 124
LDI r2, 480
LDI r3, 122
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 194
LDI r7, 39
LDI r8, 38
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
