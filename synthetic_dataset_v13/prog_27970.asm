; DESCRIPTION: Places a cyan line segment connecting (509, 16) to (394, 228).
; PLAN: r0=509(x1), r1=16(y1), r2=394(x2), r3=228(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 16
LDI r2, 394
LDI r3, 228
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
