; DESCRIPTION: Renders a cyan box of size 82x60 starting at (294, 119).
; PLAN: r0=294(x), r1=119(y), r2=82(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 119
LDI r2, 82
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
