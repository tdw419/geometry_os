; DESCRIPTION: Draws a cyan line from (429, 163) to (117, 164).
; PLAN: r0=429(x1), r1=163(y1), r2=117(x2), r3=164(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 163
LDI r2, 117
LDI r3, 164
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
