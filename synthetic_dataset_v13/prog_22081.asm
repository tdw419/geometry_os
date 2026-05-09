; DESCRIPTION: Renders a cyan box of size 33x32 starting at (477, 214).
; PLAN: r0=477(x), r1=214(y), r2=33(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 214
LDI r2, 33
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
