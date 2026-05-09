; DESCRIPTION: Renders a cyan box of size 42x60 starting at (247, 171).
; PLAN: r0=247(x), r1=171(y), r2=42(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 171
LDI r2, 42
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
