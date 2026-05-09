; DESCRIPTION: Places a cyan 14x27 rectangle at position (425, 48).
; PLAN: r0=425(x), r1=48(y), r2=14(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 48
LDI r2, 14
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
