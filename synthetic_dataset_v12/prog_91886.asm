; DESCRIPTION: Draws a cyan line from (361, 213) to (64, 214).
; PLAN: r0=361(x1), r1=213(y1), r2=64(x2), r3=214(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 213
LDI r2, 64
LDI r3, 214
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
