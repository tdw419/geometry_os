; DESCRIPTION: Places a cyan 60x50 rectangle at position (164, 125).
; PLAN: r0=164(x), r1=125(y), r2=60(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 125
LDI r2, 60
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
