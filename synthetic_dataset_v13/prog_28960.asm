; DESCRIPTION: Draws a cyan line from (126, 177) to (445, 128).
; PLAN: r0=126(x1), r1=177(y1), r2=445(x2), r3=128(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 177
LDI r2, 445
LDI r3, 128
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
