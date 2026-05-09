; DESCRIPTION: Draws a magenta line from (173, 165) to (474, 164).
; PLAN: r0=173(x1), r1=165(y1), r2=474(x2), r3=164(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 165
LDI r2, 474
LDI r3, 164
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
