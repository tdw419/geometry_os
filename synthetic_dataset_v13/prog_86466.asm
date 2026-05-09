; DESCRIPTION: Renders a cyan box of size 53x26 starting at (299, 164).
; PLAN: r0=299(x), r1=164(y), r2=53(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 164
LDI r2, 53
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
