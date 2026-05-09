; DESCRIPTION: Places a cyan 42x69 rectangle at position (334, 107).
; PLAN: r0=334(x), r1=107(y), r2=42(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 107
LDI r2, 42
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
