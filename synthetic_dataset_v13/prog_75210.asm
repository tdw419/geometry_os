; DESCRIPTION: Places a cyan 103x33 rectangle at position (310, 37).
; PLAN: r0=310(x), r1=37(y), r2=103(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 37
LDI r2, 103
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
