; DESCRIPTION: Draws a cyan line from (405, 98) to (326, 248).
; PLAN: r0=405(x1), r1=98(y1), r2=326(x2), r3=248(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 98
LDI r2, 326
LDI r3, 248
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
