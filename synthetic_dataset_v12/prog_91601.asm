; DESCRIPTION: Places a cyan line segment connecting (450, 55) to (182, 126).
; PLAN: r0=450(x1), r1=55(y1), r2=182(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 55
LDI r2, 182
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
