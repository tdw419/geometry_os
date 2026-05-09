; DESCRIPTION: Places a cyan 90x82 rectangle at position (286, 134).
; PLAN: r0=286(x), r1=134(y), r2=90(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 134
LDI r2, 90
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
