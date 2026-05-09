; DESCRIPTION: Draws a cyan line from (455, 177) to (401, 208).
; PLAN: r0=455(x1), r1=177(y1), r2=401(x2), r3=208(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 177
LDI r2, 401
LDI r3, 208
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
