; DESCRIPTION: Draws a cyan line from (413, 226) to (445, 83).
; PLAN: r0=413(x1), r1=226(y1), r2=445(x2), r3=83(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 226
LDI r2, 445
LDI r3, 83
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
