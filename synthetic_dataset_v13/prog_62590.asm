; DESCRIPTION: Renders a green line between points (333, 152) and (362, 215).
; PLAN: r0=333(x1), r1=152(y1), r2=362(x2), r3=215(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 152
LDI r2, 362
LDI r3, 215
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
