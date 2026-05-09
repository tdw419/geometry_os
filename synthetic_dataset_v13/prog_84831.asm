; DESCRIPTION: Fills the entire screen with solid white.
; PLAN: r0=0xFFFFFF(color). Op: FILL r0.
LDI r0, 0xFFFFFF
FILL r0
HALT
