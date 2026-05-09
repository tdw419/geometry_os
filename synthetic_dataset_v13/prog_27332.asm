; DESCRIPTION: Places a cyan 113x47 rectangle at position (300, 156).
; PLAN: r0=300(x), r1=156(y), r2=113(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 156
LDI r2, 113
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
