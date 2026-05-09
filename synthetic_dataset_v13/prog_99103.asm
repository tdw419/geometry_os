; DESCRIPTION: Draws a cyan line from (25, 98) to (401, 220).
; PLAN: r0=25(x1), r1=98(y1), r2=401(x2), r3=220(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 98
LDI r2, 401
LDI r3, 220
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
