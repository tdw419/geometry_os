; DESCRIPTION: Places a cyan 56x109 rectangle at position (141, 95).
; PLAN: r0=141(x), r1=95(y), r2=56(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 95
LDI r2, 56
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
