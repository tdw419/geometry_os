; DESCRIPTION: Places a cyan 94x120 rectangle at position (267, 72).
; PLAN: r0=267(x), r1=72(y), r2=94(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 72
LDI r2, 94
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
