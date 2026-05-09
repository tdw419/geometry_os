; DESCRIPTION: Draws a cyan line from (413, 71) to (213, 37).
; PLAN: r0=413(x1), r1=71(y1), r2=213(x2), r3=37(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 71
LDI r2, 213
LDI r3, 37
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
