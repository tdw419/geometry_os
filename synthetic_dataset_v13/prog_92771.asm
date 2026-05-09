; DESCRIPTION: Places a cyan line segment connecting (405, 161) to (69, 230).
; PLAN: r0=405(x1), r1=161(y1), r2=69(x2), r3=230(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 161
LDI r2, 69
LDI r3, 230
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
