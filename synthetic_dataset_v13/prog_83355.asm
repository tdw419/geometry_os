; DESCRIPTION: Places a cyan 120x54 rectangle at position (11, 27).
; PLAN: r0=11(x), r1=27(y), r2=120(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 27
LDI r2, 120
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
