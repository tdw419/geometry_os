; DESCRIPTION: Renders a cyan box of size 82x85 starting at (146, 121).
; PLAN: r0=146(x), r1=121(y), r2=82(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 121
LDI r2, 82
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
