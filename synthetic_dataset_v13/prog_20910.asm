; DESCRIPTION: Places a cyan 27x42 rectangle at position (223, 9).
; PLAN: r0=223(x), r1=9(y), r2=27(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 9
LDI r2, 27
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
