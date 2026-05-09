; DESCRIPTION: Places a cyan 84x84 rectangle at position (367, 156).
; PLAN: r0=367(x), r1=156(y), r2=84(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 156
LDI r2, 84
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
