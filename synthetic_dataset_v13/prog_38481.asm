; DESCRIPTION: Places a cyan 12x95 rectangle at position (452, 46).
; PLAN: r0=452(x), r1=46(y), r2=12(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 46
LDI r2, 12
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
