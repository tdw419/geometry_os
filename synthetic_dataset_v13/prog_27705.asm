; DESCRIPTION: Places a cyan 93x90 rectangle at position (69, 60).
; PLAN: r0=69(x), r1=60(y), r2=93(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 60
LDI r2, 93
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
