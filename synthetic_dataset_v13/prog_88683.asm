; DESCRIPTION: Places a cyan line segment connecting (241, 228) to (87, 42).
; PLAN: r0=241(x1), r1=228(y1), r2=87(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 228
LDI r2, 87
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
