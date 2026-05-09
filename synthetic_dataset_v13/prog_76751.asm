; DESCRIPTION: Composite: Draws a cyan line from (301, 234) to (44, 237) then Creates a orange rectangular region at (64, 92) spanning 39 by 57 pixels then Places a magenta circle of radius 10 at center (394, 118).
; PLAN: r0=301(x1), r1=234(y1), r2=44(x2), r3=237(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=64(x), r6=92(y), r7=39(width), r8=57(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=394(x), r11=118(y), r12=10(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 301
LDI r1, 234
LDI r2, 44
LDI r3, 237
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 64
LDI r6, 92
LDI r7, 39
LDI r8, 57
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 394
LDI r11, 118
LDI r12, 10
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
