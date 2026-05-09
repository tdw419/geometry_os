; DESCRIPTION: Draws a green line from (64, 173) to (187, 8).
; PLAN: r0=64(x1), r1=173(y1), r2=187(x2), r3=8(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 173
LDI r2, 187
LDI r3, 8
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
