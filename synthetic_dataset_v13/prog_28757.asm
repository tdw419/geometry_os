; DESCRIPTION: Draws a black line from (401, 64) to (271, 210).
; PLAN: r0=401(x1), r1=64(y1), r2=271(x2), r3=210(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 64
LDI r2, 271
LDI r3, 210
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
