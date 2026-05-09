; DESCRIPTION: Places a cyan 20x12 rectangle at position (429, 150).
; PLAN: r0=429(x), r1=150(y), r2=20(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 150
LDI r2, 20
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
