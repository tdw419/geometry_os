; DESCRIPTION: Places a cyan 27x56 rectangle at position (267, 61).
; PLAN: r0=267(x), r1=61(y), r2=27(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 61
LDI r2, 27
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
