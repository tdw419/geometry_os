; DESCRIPTION: Renders a cyan box of size 73x45 starting at (418, 197).
; PLAN: r0=418(x), r1=197(y), r2=73(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 197
LDI r2, 73
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
