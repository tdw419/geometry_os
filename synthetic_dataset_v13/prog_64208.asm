; DESCRIPTION: Draws a cyan line from (429, 120) to (128, 220).
; PLAN: r0=429(x1), r1=120(y1), r2=128(x2), r3=220(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 120
LDI r2, 128
LDI r3, 220
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
