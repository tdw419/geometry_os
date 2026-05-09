; DESCRIPTION: Draws a cyan line from (322, 248) to (6, 228).
; PLAN: r0=322(x1), r1=248(y1), r2=6(x2), r3=228(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 248
LDI r2, 6
LDI r3, 228
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
