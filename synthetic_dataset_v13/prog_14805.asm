; DESCRIPTION: Places a cyan line segment connecting (25, 154) to (445, 246).
; PLAN: r0=25(x1), r1=154(y1), r2=445(x2), r3=246(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 154
LDI r2, 445
LDI r3, 246
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
