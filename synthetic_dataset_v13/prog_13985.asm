; DESCRIPTION: Draws a green line from (352, 215) to (392, 45).
; PLAN: r0=352(x1), r1=215(y1), r2=392(x2), r3=45(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 215
LDI r2, 392
LDI r3, 45
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
