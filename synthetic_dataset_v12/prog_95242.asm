; DESCRIPTION: Draws a cyan line from (274, 13) to (35, 27).
; PLAN: r0=274(x1), r1=13(y1), r2=35(x2), r3=27(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 13
LDI r2, 35
LDI r3, 27
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
