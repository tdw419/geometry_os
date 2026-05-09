; DESCRIPTION: Draws a cyan line from (358, 179) to (487, 213).
; PLAN: r0=358(x1), r1=179(y1), r2=487(x2), r3=213(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 179
LDI r2, 487
LDI r3, 213
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
