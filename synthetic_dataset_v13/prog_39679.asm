; DESCRIPTION: Places a cyan line segment connecting (255, 154) to (182, 218).
; PLAN: r0=255(x1), r1=154(y1), r2=182(x2), r3=218(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 154
LDI r2, 182
LDI r3, 218
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
