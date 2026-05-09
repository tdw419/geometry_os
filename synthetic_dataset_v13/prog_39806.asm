; DESCRIPTION: Places a black 50x73 rectangle at position (362, 146).
; PLAN: r0=362(x), r1=146(y), r2=50(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 146
LDI r2, 50
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
