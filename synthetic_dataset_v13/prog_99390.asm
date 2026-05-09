; DESCRIPTION: Places a red 66x82 rectangle at position (111, 83).
; PLAN: r0=111(x), r1=83(y), r2=66(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 83
LDI r2, 66
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
