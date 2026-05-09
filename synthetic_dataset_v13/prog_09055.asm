; DESCRIPTION: Draws a cyan line from (216, 173) to (247, 172).
; PLAN: r0=216(x1), r1=173(y1), r2=247(x2), r3=172(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 173
LDI r2, 247
LDI r3, 172
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
