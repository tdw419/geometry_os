; DESCRIPTION: Draws a cyan line from (452, 39) to (386, 69).
; PLAN: r0=452(x1), r1=39(y1), r2=386(x2), r3=69(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 39
LDI r2, 386
LDI r3, 69
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
