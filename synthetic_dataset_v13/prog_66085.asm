; DESCRIPTION: Places a cyan 84x47 rectangle at position (362, 7).
; PLAN: r0=362(x), r1=7(y), r2=84(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 7
LDI r2, 84
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
