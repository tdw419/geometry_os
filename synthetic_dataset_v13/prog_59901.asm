; DESCRIPTION: Places a cyan 115x70 rectangle at position (336, 182).
; PLAN: r0=336(x), r1=182(y), r2=115(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 182
LDI r2, 115
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
