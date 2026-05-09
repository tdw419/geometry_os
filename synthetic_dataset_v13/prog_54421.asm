; DESCRIPTION: Places a red 46x50 rectangle at position (456, 195).
; PLAN: r0=456(x), r1=195(y), r2=46(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 195
LDI r2, 46
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
