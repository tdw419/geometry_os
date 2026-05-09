; DESCRIPTION: Draws a magenta line from (242, 230) to (469, 171).
; PLAN: r0=242(x1), r1=230(y1), r2=469(x2), r3=171(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 230
LDI r2, 469
LDI r3, 171
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
